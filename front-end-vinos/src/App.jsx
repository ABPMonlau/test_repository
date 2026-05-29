import { Routes, Route } from "react-router-dom";
import NavBar from "./components/NavBar";
import Index from "./pages";
import Celler from "./pages/Celler";
import Menus from "./pages/Menus";
import Filosofia from "./pages/Filosofia";
import Footer from "./components/Footer";

function App() {
  return (
    <main className="min-h-screen bg-canal-bg">
      <NavBar />
      <Routes>
        <Route path="/" element={<Index />} />
        <Route path="/celler" element={<Celler />} />
        <Route path="/menus" element={<Menus />} />
        <Route path="/filosofia" element={<Filosofia />} />
      </Routes>
      <Footer />
    </main>
  );
}

export default App;
