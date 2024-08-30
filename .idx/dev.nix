# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.go
    # pkgs.python311
    # pkgs.python311Packages.pip
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip

  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"

      "Dart-Code.flutter"
      "Dart-Code.dart-code"

    ];

    # Enable previews
    # previews = {
    #   enable = true;
    #   previews = {
    #     # web = {
    #     #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
    #     #   # and show it in IDX's web preview panel
    #     #   command = ["npm" "run" "dev"];
    #     #   manager = "web";
    #     #   env = {
    #     #     # Environment variables to set for your server
    #     #     PORT = "$PORT";
    #     #   };
    #     # };
    #   };
    # };





    workspace = {


    # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        build-flutter = ''
          cd /home/user/myapp/android

          ./gradlew \
            --parallel \
            -Pverbose=true \
            -Ptarget-platform=android-x86 \
            -Ptarget=/home/user/myapp/lib/main.dart \
            -Pbase-application-name=android.app.Application \
            -Pdart-defines=RkxVVFRFUl9XRUJfQ0FOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
            -Pdart-obfuscation=false \
            -Ptrack-widget-creation=true \
            -Ptree-shake-icons=false \
            -Pfilesystem-scheme=org-dartlang-root \
            assembleDebug

          # TODO: Execute web build in debug mode.
          # flutter run does this transparently either way
          # https://github.com/flutter/flutter/issues/96283#issuecomment-1144750411
          # flutter build web --profile --dart-define=Dart2jsOptimization=O0 

          adb -s localhost:5555 wait-for-device
        '';
      };

    };

    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };




    # Workspace lifecycle hooks
    # workspace = {
    #   # Runs when a workspace is first created
    #   onCreate = {
    #     # Example: install JS dependencies from NPM
    #     # npm-install = "npm install";
    #   };
    #   # Runs when the workspace is (re)started
    #   onStart = {
    #     # Example: start a background task to watch and re-build backend code
    #     # watch-backend = "npm run watch-backend";
    #   };
    # };
  };
}
