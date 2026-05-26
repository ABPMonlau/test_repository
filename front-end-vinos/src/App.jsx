import { Routes, Route } from "react-router-dom";
import NavBar from "./components/NavBar";
import Index from "./pages";

function App() {
  return (
    <main className="min-h-screen bg-canal-bg">
      <NavBar />
      <Routes>
        <Route path="/" element={<Index />} />
      </Routes>
    </main>
  );
}

export default App;
