import React, { useEffect, useState } from 'react';
import { Text, View } from 'react-native';
const {firebaseApp} = require('./firebaseConfig');
import { getAuth, onAuthStateChanged } from "firebase/auth";
import LoginPage from './Pages/LoginPage';
 import ToDoListPage from './Pages/ToDoListPage';

const App = () => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const auth = getAuth(firebaseApp);

  useEffect(() => {

    const unsubscribe = onAuthStateChanged(auth, (user) => {
      setUser(user);
      setLoading(false);
    });

    return unsubscribe;
  }, [auth]);

  if (loading) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (!user) {
    return (
      <LoginPage />
    );
  }

  return (
    <ToDoListPage/>
  );
}

export default App;