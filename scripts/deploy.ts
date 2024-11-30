import { CallData, Contract, stark } from "starknet";
import { getCompiledCode} from "./utils";
import { account ,provider ,constructorData} from "./initializer";


async function main() {

  // Declare & deploy contract
  let sierraCode, casmCode;
  try {
    ({ sierraCode, casmCode } = await getCompiledCode(
      "boilerplate_erc20_contract"
    ));
  } catch (error: any) {
    console.log("Failed to read contract files");
    process.exit(1);
  }

  const myCallData = new CallData(sierraCode.abi);
  const constructor = myCallData.compile("constructor",constructorData);

  const deployResponse = await account.declareAndDeploy({
    contract: sierraCode,
    casm: casmCode,
    constructorCalldata: constructor,
    salt: stark.randomAddress(),
  });
  // Connect the new contract instance :
  const deploytContract = new Contract(
    sierraCode.abi,
    deployResponse.deploy.contract_address,
    provider
  );

  if (constructorData.network === "sepolia"){
    console.log(
      `✅ Contract has been deploy with the address: https://sepolia.voyager.online/contract/${deploytContract.address}`
    );
  } else if (constructorData.network === "mainnet"){
    console.log(
      `✅ Contract has been deploy with the address: https://voyager.online/contract/${deploytContract.address}`
    );
  }
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
