import React from "react";
import FullnameButton from "./components/FullnameButton";
import LocationButton from "./components/LocationButton";
import MaritalButton from "./components/MaritalButton";

function App() {

  return (
    <div style={{ textAlign: "center", marginTop: "40px" }}>

      <h1>Kubernetes Microservice Demo</h1>

      <FullnameButton />

      <LocationButton />

      <MaritalButton />

    </div>
  );
}

export default App;