{
  description = ''Discord RPC/Rich Presence client'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-discord_rpc-master.flake = false;
  inputs.src-discord_rpc-master.owner = "SolitudeSF";
  inputs.src-discord_rpc-master.ref   = "refs/heads/master";
  inputs.src-discord_rpc-master.repo  = "discord_rpc";
  inputs.src-discord_rpc-master.type  = "github";
  
  inputs."uuids".owner = "nim-nix-pkgs";
  inputs."uuids".ref   = "master";
  inputs."uuids".repo  = "uuids";
  inputs."uuids".type  = "github";
  inputs."uuids".inputs.nixpkgs.follows = "nixpkgs";
  inputs."uuids".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."packedjson".owner = "nim-nix-pkgs";
  inputs."packedjson".ref   = "master";
  inputs."packedjson".repo  = "packedjson";
  inputs."packedjson".type  = "github";
  inputs."packedjson".inputs.nixpkgs.follows = "nixpkgs";
  inputs."packedjson".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-discord_rpc-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-discord_rpc-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}