import React, {useEffect, useState} from 'react';

function App() {
  const [msg, setMsg] = useState(null);
  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_URL || 'http://localhost:8000'}/ping/`)
      .then(res => res.json())
      .then(json => setMsg(json));
  }, []);
  return (
    <div>
      <h1>React Frontend</h1>
      <pre>{JSON.stringify(msg, null, 2)}</pre>
    </div>
  );
}

export default App;
