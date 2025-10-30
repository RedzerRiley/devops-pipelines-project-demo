import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [users, setUsers] = useState([]);
  const [name, setName] = useState('');

  useEffect(() => {
    axios.get('http://localhost:3000/users').then(res => setUsers(res.data));
  }, []);

  const addUser = async () => {
    const res = await axios.post('http://localhost:3000/users', { name });
    setUsers([...users, res.data]);
    setName('');
  };

  return (
    <div>
      <h1>Users</h1>
      <input value={name} onChange={e => setName(e.target.value)} />
      <button onClick={addUser}>Add User</button>
      <ul>{users.map(user => <li key={user.id}>{user.name}</li>)}</ul>
    </div>
  );
}

export default App;
