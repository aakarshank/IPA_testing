const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("Users/" + user.uid);
  await firestore
    .collectionGroup("Zipcodes")
    .where("businessRef", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection Zipcodes`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collectionGroup("RedemptionHistory")
    .where("userRef", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection RedemptionHistory`,
        );
        await doc.ref.delete();
      }
    });
});
