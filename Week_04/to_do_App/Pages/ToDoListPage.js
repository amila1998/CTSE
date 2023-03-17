import { useState, useEffect } from 'react';
import { getFirestore, doc, collection, setDoc, addDoc, updateDoc, deleteDoc, onSnapshot, query, where, getDocs } from 'firebase/firestore';
import { getAuth, signOut } from 'firebase/auth';
import { firebaseApp } from '../firebaseConfig';
import { FlatList, Text, TextInput, TouchableOpacity, View } from 'react-native';
import { Header, Icon } from 'react-native-elements';
import { SafeAreaProvider } from 'react-native-safe-area-context';

const ToDoPage = () => {
  const [toDos, setToDos] = useState([]);
  const [newToDo, setNewToDo] = useState('');
  const [callback, setCallBack] = useState(true);
  const db = getFirestore(firebaseApp);
  const auth = getAuth();
  const userId = auth.currentUser?.uid;

  const handleLogout = () => {
    signOut(auth).then(() => {
      console.log('User signed out');
    }).catch((error) => {
      console.log('Error signing out:', error);
    });
  };

  // Load to-dos from Firestore
  useEffect(() => {
    if (!userId) return;
    const getTodosByUserId = async () => {
      const todoCollection = await collection(db, "todos");
      const todoQuery = query(todoCollection, where("userId", "==", userId));
      const todoQuerySnapshot = await getDocs(todoQuery);
      console.log("🚀 ~ file: ToDoListPage.js:23 ~ getTodosByUserId ~ todoQuerySnapshot:", todoQuerySnapshot)
      const newToDos = todoQuerySnapshot.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
      }));
      setToDos(newToDos);
    }

    if (callback) {
      getTodosByUserId();
      setCallBack(false);
    }

  }, [userId, callback]);

  // Add a new to-do to Firestore
  const handleAddToDo = async () => {
    if (!userId) return;

    const todosCollection = collection(db, "todos");
    const newToDoDocRef = doc(todosCollection);

    await setDoc(newToDoDocRef, {
      title: newToDo,
      userId: userId,
      completed: false,
    })
      .then(() => {
        console.log('To-do added successfully');
      })
      .catch((error) => {
        console.log('Error adding to-do:', error);
      });

    setNewToDo('');
    setCallBack(true);
  };

  // Update a to-do in Firestore
  const handleUpdateToDo = async (id, completed) => {
    if (!userId) return;

    const todoRef = doc(db, "todos", id);

    await updateDoc(todoRef, {
      completed: completed,
    })
      .then(() => {
        console.log('To-do updated successfully');
      })
      .catch((error) => {
        console.log('Error updating to-do:', error);
      });

    setCallBack(true);
  };

  // Delete a to-do from Firestore
  const handleDeleteToDo = async (id) => {
    if (!userId) return;

    const todoRef = doc(db, "todos", id);

    await deleteDoc(todoRef)
      .then(() => {
        console.log('To-do deleted successfully');
      })
      .catch((error) => {
        console.log('Error deleting to-do:', error);
      });

    setCallBack(true);
  };

  // Render a to-do item
  const renderToDoItem = ({ item }) => (
    <View style={{ flexDirection: 'row', alignItems: 'center', paddingVertical: 8 }}>
      <TouchableOpacity onPress={() => handleUpdateToDo(item.id, !item.completed)}>
        <View style={{ width: 20, height: 20, borderWidth: 1, marginRight: 10, backgroundColor: item.completed ? 'green' : 'white' }}></View>
      </TouchableOpacity>
      <Text style={{ flex: 1, fontSize: 16, color: item.completed ?'#444444':'black' }}>{item.title}</Text>
      <TouchableOpacity onPress={() => handleDeleteToDo(item.id)}>
        <Icon name='delete' color='red' />
      </TouchableOpacity>
    </View>
);

  // Render the header
  const renderHeader = () => (
    <Header
      placement="left"
      leftComponent={{ icon: 'menu', color: '#fff' }}
      centerComponent={{ text: 'To-Do List', style: { color: '#fff', fontSize: 20 } }}
      rightComponent={<TouchableOpacity onPress={() => handleLogout()}><Icon name='logout' color='#fff' /></TouchableOpacity>}
      containerStyle={{ backgroundColor: '#2E86C1', justifyContent: 'space-around' }}
    />
  );

  return (
    <SafeAreaProvider>
    <View style={{ flex: 1 }}>
      {renderHeader()}
      <View style={{ flexDirection: 'row', alignItems: 'center', paddingHorizontal: 20 }}>
        <TextInput
          placeholder="New To-Do"
          value={newToDo}
          onChangeText={setNewToDo}
          style={{ flex: 1, height: 40, borderWidth: 1, paddingHorizontal: 10 }}
        />
        <TouchableOpacity onPress={handleAddToDo} style={{ backgroundColor: '#2E86C1', height: 40, justifyContent: 'center', paddingHorizontal: 20 }}>
          <Text style={{ color: '#fff' }}>Add</Text>
        </TouchableOpacity>
      </View>
      <FlatList
        data={toDos}
        renderItem={renderToDoItem}
        keyExtractor={(item) => item.id}
        style={{ paddingHorizontal: 20 }}
      />
    </View>
    </SafeAreaProvider>
  );
}

export default ToDoPage;