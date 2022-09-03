import logo from './matias.png';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Aqui podemos ver essa belissima especime
        </p>
        <a
          className="App-link"
          href="https://counterstrike.fandom.com/wiki/Flashbang"
          target="_blank"
          rel="noopener noreferrer"
        >
         Olho no lance
        </a>
      </header>
    </div>
  );
}

export default App;
