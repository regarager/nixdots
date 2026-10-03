{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openvpn
    netcat
    nmap
    metasploit
    gdb
    gef
    ghidra
    pwntools
    radare2
    one_gadget
  ];
}
