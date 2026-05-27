import { Routes, Route } from "react-router-dom";
import NavBar from "./components/NavBar";
import Index from "./pages";
import Celler from "./pages/Celler";
import Footer from "./components/Footer";

function App() {
  return (
    <main className="min-h-screen bg-canal-bg">
      <NavBar />
      <Routes>
        <Route path="/" element={<Index />} />
        <Route path="/celler" element={<Celler />} />
      </Routes>
      <Footer />
    </main>
  );
}

export default App;
