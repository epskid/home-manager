{ ... }:

{
  services.podman = {
    enable = true;
    containers.excalidraw = {
      image = "docker.io/excalidraw/excalidraw";
      description = "Excalidraw client";
      ports = [ "5000:80" ];
    };
  };
}
