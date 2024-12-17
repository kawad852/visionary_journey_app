const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onOrderCreate = onDocumentCreated({
  region: "europe-west3",
  document: "orders/{id}",
}, async (event) => {
  const snapshot = event.data;
  const data = snapshot.data();
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
        id: tradeId,
        type: "trade",
        channel_id: "channel_id_2",
      },
      notification: {
        title: title,
        body: body,
        priority: "high",
        apns: {
          aps: {
            sound: "default",
          },
        },
        click_action: "FLUTTER_NOTIFICATION_CLICK",
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
