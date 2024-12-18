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
  const snapshot = event.data;
  const data = snapshot.data();
  const orderId = data.id;
  const userId = data.userId;
  const status = data.status;

  console.log("Order ID:", orderId);

  const userDoc = await admin.firestore().collection("users").doc(userId).get();
  if (!userDoc.exists) {
    console.error(`User document fo userId ${userId} does not exist.`);
    return null;
  }

  const userData = userDoc.data();
  const deviceToken = userData.deviceToken;
  const language = userData.languageCode;
  const gender = data.gender;

  if (!deviceToken) {
    console.error(`No token found fo userId ${userId}.`);
    return null;
  }

  console.log(`Device Token fo User ID ${userId}:`, deviceToken);

  await sendNotification(status, language, gender, deviceToken);

  return null;
});

/**
 * Sends notifications in both English and Arabic, and creates corresponding
 * notification documents in Firestore.
 *
 * @param {string} status - The Status of the order related to the notification.
 * @param {string} language - The Status of the order related to the.
 * @param {string} gender - The Status of the.
 * @param {string} deviceToken - The Device Token.
 */
async function sendNotification(status, language, gender, deviceToken) {
  const isEnglish = language == "en";
  const isMale = gender == "MALE";

  let sound = "";
  let channelId = "";
  let title = "";
  let body = "";

  // Determine values
  switch (status) {
    case OrderEnum.driverAssigned:
      if (isMale && isEnglish) {
        channelId = "channel_id_1";
        sound = "male_en_1.wav";
        title = "Driver Assigned";
        body = "A driver has been assigned to your order.";
      } else if (!isMale && isEnglish) {
        channelId = "channel_id_2";
        sound = "female_en_1.wav";
        title = "Driver Assigned";
        body = "A driver has been assigned to your order.";
      } else if (isMale && !isEnglish) {
        channelId = "channel_id_3";
        sound = "male_ar_1.wav";
        title = "تم تعيين سائق";
        body = "تم تعيين سائق لطلبك.";
      } else {
        channelId = "channel_id_4";
        sound = "female_ar_1.wav";
        title = "تم تعيين سائق";
        body = "تم تعيين سائق لطلبك.";
      }
      break;

    case OrderEnum.driverArrived:
      if (isMale && isEnglish) {
        channelId = "channel_id_5";
        sound = "male_en_2.wav";
        title = "Driver Arrived";
        body = "Your driver has arrived at the pickup location.";
      } else if (!isMale && isEnglish) {
        channelId = "channel_id_6";
        sound = "female_en_2.wav";
        title = "Driver Arrived";
        body = "Your driver has arrived at the pickup location.";
      } else if (isMale && !isEnglish) {
        channelId = "channel_id_7";
        sound = "male_ar_2.wav";
        title = "وصل السائق";
        body = "وصل السائق إلى موقع الالتقاط.";
      } else {
        channelId = "channel_id_8";
        sound = "female_ar_2.wav";
        title = "وصل السائق";
        body = "وصل السائق إلى موقع الالتقاط.";
      }
      break;

    case OrderEnum.inProgress:
      if (isMale && isEnglish) {
        channelId = "channel_id_9";
        sound = "male_en_3.wav";
        title = "Order in Progress";
        body = "Your order is currently in progress.";
      } else if (!isMale && isEnglish) {
        channelId = "channel_id_10";
        sound = "female_en_3.wav";
        title = "Order in Progress";
        body = "Your order is currently in progress.";
      } else if (isMale && !isEnglish) {
        channelId = "channel_id_11";
        sound = "male_ar_3.wav";
        title = "الطلب قيد التنفيذ";
        body = "طلبك قيد التنفيذ حالياً.";
      } else {
        channelId = "channel_id_12";
        sound = "female_ar_3.wav";
        title = "الطلب قيد التنفيذ";
        body = "طلبك قيد التنفيذ حالياً.";
      }
      break;

    case OrderEnum.inReview:
      if (isMale && isEnglish) {
        channelId = "channel_id_13";
        sound = "male_en_4.wav";
        title = "Order in Review";
        body = "Your order is being reviewed.";
      } else if (!isMale && isEnglish) {
        channelId = "channel_id_14";
        sound = "female_en_4.wav";
        title = "Order in Review";
        body = "Your order is being reviewed.";
      } else if (isMale && !isEnglish) {
        channelId = "channel_id_15";
        sound = "male_ar_4.wav";
        title = "الطلب قيد المراجعة";
        body = "طلبك قيد المراجعة.";
      } else {
        channelId = "channel_id_16";
        sound = "female_ar_4.wav";
        title = "الطلب قيد المراجعة";
        body = "طلبك قيد المراجعة.";
      }
      break;

    case OrderEnum.completed:
      if (isMale && isEnglish) {
        channelId = "channel_id_17";
        sound = "male_en_5.wav";
        title = "Order Completed";
        body = "Your order has been successfully completed.";
      } else if (!isMale && isEnglish) {
        channelId = "channel_id_18";
        sound = "female_en_5.wav";
        title = "Order Completed";
        body = "Your order has been successfully completed.";
      } else if (isMale && !isEnglish) {
        channelId = "channel_id_19";
        sound = "male_ar_5.wav";
        title = "اكتمل الطلب";
        body = "تم اكتمال طلبك بنجاح.";
      } else {
        channelId = "channel_id_20";
        sound = "female_ar_5.wav";
        title = "اكتمل الطلب";
        body = "تم اكتمال طلبك بنجاح.";
      }
      break;

    default:
      channelId = "default_channel";
      sound = "default_sound.wav";
      title = isEnglish ? "Notification" : "إشعار";
      body = isEnglish ? "You have a new notification." :
                         "لديك إشعار جديد.";
      break;
  }

  const message = {
    notification: {
      title: title,
      body: body,
    },
    data: {
      channel_id: channelId,
    },
    android: {
      notification: {
        channelId: channelId,
        sound: sound,
      },
    },
    apns: {
      payload: {
        aps: {
          alert: {
            title: title,
            body: body,
          },
          sound: sound,
        },
      },
    },
    token: deviceToken,
  };

  try {
    await admin.messaging().send(message);
    console.log("Notification Sent!", message);
  } catch (error) {
    console.error(`Error sending notification to Firestore:`, error);
  }
}
