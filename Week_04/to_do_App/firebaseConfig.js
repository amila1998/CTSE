import { initializeApp } from 'firebase/app';
import { getAuth ,onAuthStateChanged} from "firebase/auth";
import 'firebase/database';
import { getFirestore } from 'firebase/firestore';

const firebaseConfig = {
    apiKey: "AIzaSyAv6CpfH75S5oKD9Nw0x-bL8BxqBHU05s8",
    authDomain: "todoapp-dbef3.firebaseapp.com",
    projectId: "todoapp-dbef3",
    storageBucket: "todoapp-dbef3.appspot.com",
    messagingSenderId: "984216547206",
    appId: "1:984216547206:web:1c613395f35f5b407e4607",
    measurementId: "G-Q7B6ZN77JL"
};

// if (!firebase.apps?.length) {
  const firebaseApp = initializeApp(firebaseConfig);
  const auth = getAuth(firebaseApp);
  const firestore = getFirestore(firebaseApp);
// }

export default {firebaseApp,auth,firestore};