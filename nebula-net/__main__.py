import json
from datetime import datetime
from pathlib import Path
import subprocess
import pytz


class Nebula:
    def __init__(self):
        # Check if the root CA certificate file exists
        root_ca_path = Path.cwd() / "ca.crt"
        if root_ca_path.exists():
            # Read the network name and expiration date from the root certificate
            output = subprocess.check_output(
                ["nebula-cert", "print", "-path", str(root_ca_path), "-json"]
            )
            data = json.loads(output.decode("utf-8"))
            self.network_name = data["details"]["name"]
            self.not_after = datetime.fromisoformat(data["details"]["notAfter"])
            self.not_before = datetime.fromisoformat(data["details"]["notBefore"])
            self.root = root_ca_path
        else:
            self.network_name = None
            self.not_after = None
            self.not_before = None
            self.root = None

    def create_root_ca(self, network_name):
        subprocess.run(["nebula-cert", "ca", "-name", network_name])
        self.__init__()

    def add_node(self, name, ip):
        # TODO: Implement node creation logic
        pass

    def valid_remaining(self):
        if self.not_after is None:
            return None
        else:
            remaining = self.not_after - datetime.now(pytz.utc)
            return remaining

    def __str__(self):
        if self.root is None:
            return "No root certificate found."
        else:
            return (
                f"Network name: {self.network_name}\n"
                f"Root certificate expires on: {self.not_after}\n"
                f"Root certificate invalid before: {self.not_before}\n"
                f"Time remaining until expiration: {self.valid_remaining()}\n"
            )


def main():
    nebula = Nebula()
    if nebula.root is not None:
        print(nebula)
    else:
        network_name = input("Please enter the name of your network: ")
        nebula.create_root_ca(network_name)


if __name__ == "__main__":
    main()
