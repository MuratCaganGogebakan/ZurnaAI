import requests


class EtherscanAPI:
    def __init__(self, api_key, network="mainnet"):
        self.api_key = api_key
        self.network = network
        if network == "mainnet":
            self.api_name = "api"
        elif network == "sepolia":
            self.api_name = "api-sepolia"
        elif network == "goerli":
            self.api_name = "api-goerli"
        else:
            raise ValueError("Invalid network")

    def get_source_code(self, contract_address):
        url = "https://{}.etherscan.io/api?module=contract&action=getsourcecode&address={}&apikey={}".format(
            self.api_name, contract_address, self.api_key
        )
        response = requests.get(url)
        if response.status_code == 200:
            return response.json()["result"][0]["SourceCode"]
        else:
            return None