export const getFullname = async () => {
  const res = await fetch("/fullname");
  return res.json();
};

export const getLocation = async () => {
  const res = await fetch("/location");
  return res.json();
};

export const getMaritalStatus = async () => {
  const res = await fetch("/marital-status");
  return res.json();
};