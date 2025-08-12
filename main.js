const provider = new ethers.JsonRpcProvider("https://rpc.lightchain.ai");
const contractAddress = "0x3116771fde5F2c4dD56bF3AD6a2374A0D0490194";
const abi = [
  "function count() view returns (uint256)",
  "function increment()"
];
const signer = provider.getSigner?.() || null;
const contract = new ethers.Contract(contractAddress, abi, signer || provider);

async function updateRollCount() {
  try {
    const count = await contract.count();
    document.getElementById("roll-count").textContent = `Total Rolls: ${count}`;
  } catch (err) {
    console.error("Error fetching roll count:", err);
    document.getElementById("roll-count").textContent = "Error loading rolls.";
  }
}

document.getElementById("roll-button").addEventListener("click", async () => {
  try {
    const tx = await contract.increment();
    await tx.wait();
    updateRollCount();
  } catch (err) {
    console.error("Roll failed:", err);
    alert("Roll failed. Check console.");
  }
});

updateRollCount();
