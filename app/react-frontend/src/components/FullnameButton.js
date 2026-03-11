import React from "react";
import { getFullname } from "../api/api";

function FullnameButton() {

  const handleClick = async () => {
    const data = await getFullname();

    alert(`Fullname: ${data.fullname}\nSource: ${data.source}`);
  };

  return (
    <div>
      <button onClick={handleClick}>
        Get Full Name
      </button>
    </div>
  );
}

export default FullnameButton;