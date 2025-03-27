{ lib, pkgs, ... }:
{
	home = {
		packages = with pkgs; [
		hello
		];

		username = "clement";
		homeDirectory = "/home/clement";

		stateVersion = "23.11";
	};
}
