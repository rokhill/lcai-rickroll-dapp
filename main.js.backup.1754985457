import { ethers } from "https://cdn.jsdelivr.net/npm/ethers@6.7.0/+esm";

const provider = new ethers.BrowserProvider(window.ethereum);
const contractAddress = "0x3116771fde5F2c4dD56bF3AD6a2374A0D0490194";
const abi = [
  "function count() view returns (uint256)",
  "function increment()"
];

let signer;
let contract;

async function init() {
  try {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    signer = await provider.getSigner();
    contract = new ethers.Contract(contractAddress, abi, signer);
    updateRollCount();
    setInterval(updateRollCount, 5000);
  } catch (err) {
    console.error("Wallet connection failed:", err);
  }
}

async function updateRollCount() {
  try {
    const count = await contract.count();
    document.getElementById("roll-count").textContent = count.toString();
  } catch (err) {
    console.error("Failed to fetch roll count:", err);
  }
}

document.getElementById("rick-gif").addEventListener("click", async () => {
  try {
    const tx = await contract.increment();
    await tx.wait();
    updateRollCount();
    const audio = document.getElementById("rick-audio");
    audio.currentTime = 0;
    audio.play();
  } catch (err) {
    console.error("Failed to increment roll count:", err);
  }
});

init();
