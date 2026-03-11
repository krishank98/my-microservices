import React from "react";
import { getMaritalStatus } from "../api/api";

function MaritalButton() {

  const handleClick = async () => {

    const data = await getMaritalStatus();

    alert(`Marital Status: ${data.status}\nSource: ${data.source}`);

  };

  return (
    <div>

      <button onClick={handleClick}>
        Get Marital Status
      </button>

    </div>
  );
}

export default MaritalButton;