{

  inputs = {
    haedosa.url = "github:haedosa/flakes/22.05";
    nixpkgs.follows = "haedosa/nixpkgs";
    flake-utils.follows = "haedosa/flake-utils";
  };

  outputs = input@{self, nixpkgs, flake-utils, ...} :

    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let

        pkgs = import nixpkgs {
          inherit system;
    #      overlays = [ self.overlay ];
        };

      in rec {
        packages.pixiecore = pkgs.pixiecore;
        packages.wakeonlan = pkgs.wakeonlan;
        packages.syslinux = pkgs.syslinux;
        packages.mtools = pkgs.mtools;
        packages.cpio = pkgs.cpio;
        packages.dosfstools = pkgs.dosfstools;
        packages.ms-sys = pkgs.ms-sys;
        packages.gparted = pkgs.gparted;

        defaultPackage = packages.pixiecore;
        #defaultApp = {
        #  type = "app";
        #  program = "${pkgs.s4}/bin/S4";
        #};
        #devShell = pkgs.mkShell {
        #  buildInputs = with pkgs; [ lua python3Full blas liblapack openmpi fftw suitesparse boost];
        #  # buildInputs = with pkgs; [ lua python3Full openblasCompat(blas, openblasCompat is also avaiable but openblas is not allowed) ];
        #};

        #packages = flake-utils.lib.flattenTree {
        #  gnuplot = pkgs.gnuplot;
        #};
        #apps.gnuplot = flake-utils.lib.mkApp { drv = packages.gnuplot; };
        #defaultPackage = packages.s4;
        #defaultApp = apps.gnuplot;
       # packages.x86_64-linux.gnuplot = pkgs.legacyPackages.x86_64-linux.gnuplot;
      });

}
