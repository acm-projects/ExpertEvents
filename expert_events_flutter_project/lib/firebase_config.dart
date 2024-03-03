import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";


const firebaseConfig = {
  apiKey: "AIzaSyDETWQoioLp4Db5Io5UOMHYDXuII5Lwi6Q",
  authDomain: "expertevents-7bbc6.firebaseapp.com",
  projectId: "expertevents-7bbc6",
  storageBucket: "expertevents-7bbc6.appspot.com",
  messagingSenderId: "871374619509",
  appId: "1:871374619509:web:0f4b1b1f0b3bbe1d41893c",
  measurementId: "G-VF7EVZYBFH"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);