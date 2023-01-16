const hre = require("hardhat");

async function main() {
  const OrphanFundDAO = await hre.ethers.getContractFactory("OrphanFundDAO");
  const orphanFundDAO = await OrphanFundDAO.deploy();

  await orphanFundDAO.deployed();

  console.log("Library deployed to:", orphanFundDAO.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});