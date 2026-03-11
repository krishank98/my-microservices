import React from "react";
import { getLocation } from "../api/api";

function LocationButton() {

  const handleClick = async () => {
    const data = await getLocation();

    alert(`Location: ${data.location}\nSource: ${data.source}`);
  };

  return (
    <div>
      <button onClick={handleClick}>
        Get Location
      </button>
    </div>
  );
}

export default LocationButton;