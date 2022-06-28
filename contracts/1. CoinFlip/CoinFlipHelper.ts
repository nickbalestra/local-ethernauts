import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // add code here that will help you pass the test
  // flipping the coin 10 times through the attacker
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
