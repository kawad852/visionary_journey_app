const {onDocumentUpdated} = require("firebase-functions/v2/firestore");
const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");
admin.initializeApp();

const OrderEnum = {
  driverAssigned: "DRIVER_ASSIGNED",
  driverArrived: "DRIVER_ARRIVED",
  inProgress: "IN_PROGRESS",
  inReview: "IN_REVIEW",
  completed: "COMPLETED",
};

exports.onOrderCreate = onDocumentCreated({
  region: "europe-west3",
  document: "orders/{id}",
}, async (event) => {
  const snapshot = event.rawValue;
  const data = snapshot || {};
  const orderId = data.id;
  const userId = data.userId;

  console.log("Order ID:", orderId);

  const titleEn = "New Trade";
  const titleAr = "صفقة جديدة";
  const bodyEn = "Guru team has added a new trade!";
  const bodyAr = "قام فريق جورو بإضافة صفقة جديدة ,اضغط للإطلاع.";

  const userDoc = await admin.firestore().collection("users").doc(userId).get();
  if (!userDoc.exists) {
    console.error(`User document fo userId ${userId} does not exist.`);
    return null;
  }

  const userData = userDoc.data();
  const deviceToken = userData.deviceToken;

  if (!deviceToken) {
    console.error(`No token found fo userId ${userId}.`);
    return null;
  }

  console.log(`Device Token fo User ID ${userId}:`, deviceToken);

  await sendNotification(orderId, titleEn, titleAr, bodyEn,
      bodyAr, "all", deviceToken);

  return null;
});

exports.onTradeUpdate = onDocumentUpdated({
  region: "europe-west3",
  document: "trades/{tradeId}",
}, async (event) => {
  const oldData = event.data.before.data();
  const newData = event.data.after.data();
  const tradeId = newData.id;
  const beforeTargets = oldData.targets;
  const afterTargets = newData.targets;
  const newStatus = newData.status;
  const currencySymbol = newData.currency.symbol;

  const changedTargetIndex =
      findChangedTargetIndex(beforeTargets, afterTargets);

  let titleEn = "";
  let titleAr = "";
  let bodyEn = "";
  let bodyAr = "";
  let nTopic = "";

  if (newData.status == OrderEnum.running) {
    nTopic = "all";
  } else {
    nTopic = `trade_${tradeId}`;
  }

  // Check if status field has changed
  if (newData.status !== oldData.status) {
    switch (newStatus) {
      case OrderEnum.driverAssigned:
        titleEn = `The trade has been added ${currencySymbol}`;
        titleAr = `تم إضافة الصفقة ${currencySymbol}`;
        bodyEn = `based on a recommendation from the Guru team. 📊`;
        bodyAr = `بناءً على توصية من فريق جورو. 📊`;
        break;
      case OrderEnum.driverArrived:
        titleEn = `The trade has been activated ${currencySymbol}.`;
        titleAr = `تم تفعيل الصفقة ${currencySymbol}`;
        bodyEn = "The current price is ideal for entering the trade.";
        bodyAr = `السعر الحالي مثالي لدخول الصفقة`;
        break;
      case OrderEnum.inProgress:
        titleEn = `Successful trade! 🎯${currencySymbol}`;
        titleAr = `صفقة ناجحة! 🎯 ${currencySymbol}`;
        bodyEn = `We recommend exiting now and enjoying the great results! 🏅`;
        bodyAr = `نوصي بالخروج الآن والاستمتاع بالنتائج الرائعة! 🏅`;
        break;
      case OrderEnum.inReview:
        titleEn = `The trade has been canceled. ${currencySymbol}`;
        titleAr = `تم إلغاء الصفقة ${currencySymbol}`;
        bodyEn = "Don't worry, profitable opportunities are on the way! 🔑";
        bodyAr = `لا تقلق، الفرص المربحة قادمة! 🔑`;
        break;
      case OrderEnum.completed:
        titleEn = `Close the trade ${currencySymbol}`;
        titleAr = `اغلاق الصفقة ${currencySymbol}`;
        bodyEn = "And look for new opportunities." +
        "The upcoming opportunities are better! 💪";
        bodyAr = "والبحث عن فرص جديدة. الفرص القادمة أفضل! 💪";
        break;
      default:
        titleEn = `The trade has been modified ${currencySymbol}`;
        titleAr = `تم تعديل الصفقة ${currencySymbol}`;
        bodyEn = "The Guru team has made an update to the trade." +
        "Click to view the updates.";
        bodyAr =
        "قام فريق جورو بإجراء تعديل على الصفقة , اضغط للاطلاع على التحديثات.";
    }

    await sendNotification(tradeId, titleEn, titleAr,
        bodyEn, bodyAr, nTopic);
  } else if (changedTargetIndex != null) {
    titleEn = `Congratulations 🎉`;
    titleAr = `تهانينا! 🎉`;
    bodyEn = `The ${changedTargetIndex} target has been achieved.` +
    `We recommend securing the trade now to protect your profits 💰`;
    const bodyAr = "تم تحقيق الهدف " +
                   changedTargetIndex +
                   ". نوصي بتأمين الصفقة الآن لحماية الأرباح. 💰";
    await sendNotification(tradeId, titleEn, titleAr,
        bodyEn, bodyAr, nTopic);
  } else {
    titleEn = `The trade has been modified ${currencySymbol}`;
    titleAr = `تم تعديل الصفقة ${currencySymbol}`;
    bodyEn =
    "The Guru team has made an update to the trade. Click to view the updates.";
    bodyAr =
    "قام فريق جورو بإجراء تعديل على الصفقة , اضغط للاطلاع على التحديثات.";
    await sendNotification(tradeId, titleEn, titleAr,
        bodyEn, bodyAr, nTopic);
  }
  return null;
});

/**
 * Sends notifications in both English and Arabic, and creates corresponding
 * notification documents in Firestore.
 *
 * @param {string} tradeId - The ID of the trade related to the notification.
 * @param {string} titleEn - The English title for the notification.
 * @param {string} titleAr - The Arabic title for the notification.
 * @param {string} bodyEn - The English body for the notification.
 * @param {string} bodyAr - The Arabic body for the notification.
 * @param {string} nTopic - The Topic for the notification.
 * @param {string} deviceToken - The Device Token.
 */
async function sendNotification(tradeId, titleEn, titleAr,
    bodyEn, bodyAr, nTopic, deviceToken) {
  for (let i = 0; i < 2; i++) {
    const isEnglish = i === 0;
    const title = isEnglish ? titleEn : titleAr;
    const body = isEnglish ? bodyEn : bodyAr;
    const topic = isEnglish ? `${nTopic}_en` : `${nTopic}_ar`;

    // Define the notification data for Firestore
    const notificationData = {
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      data: {
        id: tradeId,
        type: "trade",
      },
      topic: topic,
      notification: {
        title: title,
        body: body,
      },
      priority: "high",
      apns: {
        aps: {
          sound: "default",
        },
      },
      click_action: "FLUTTER_NOTIFICATION_CLICK",
    };

    // Define the notification payload for Firebase Messaging
    const payload = {
      token: deviceToken,
      data: {
        channel_id: "channel_id_2",
      },
      notification: {
        title: title,
        priority: "high",
        click_action: "FLUTTER_NOTIFICATION_CLICK",
        body: body,
        sound: "end_match_helf.wav",
        android_channel_id: "channel_id_2",
      },
    };

    try {
      admin.messaging().send(payload);
      console.log(`Successfully sent ${isEnglish ?
      "English" : "Arabic"} notification.`);

      admin.firestore().collection("notifications").add(notificationData);
      console.log(`Notification document added ${isEnglish ?
      "English" : "Arabic"} notification. --topic: ${topic}`);
    } catch (error) {
      console.error(`Error sending notification to Firestore:`, error);
    }
  }
}

/**
 * Finds the index of the first target whose `achieved` status changed to true.
 * @param {Array<Object>} beforeTargets - Targets before the update.
 * @param {Array<Object>} afterTargets - Targets after the update.
 * @return {number|null} - The index of the changed target.
 */
function findChangedTargetIndex(beforeTargets, afterTargets) {
  for (let i = 0; i < afterTargets.length; i++) {
    const afterTarget = afterTargets[i];
    const beforeTarget = beforeTargets[i];

    // If `achieved` is now true and wasn't true before, return the index
    if (afterTarget.achieved && (!beforeTarget || !beforeTarget.achieved)) {
      return i;
    }
  }
  return null; // No changes found
}
