{...}: 
{
  programs.wofi = {
    enable = true;
    style = "
      * {
          all: unset;
          font-family: 'JetBrainsMono Nerd Font';
          font-size: 16px;
      }

      #window {
          background-color: #292a37;
      }

      #outer-box {
          background-color: #292a37;
          border: 4px solid #44465c;
      }

      #input{
          margin: 1rem;
          padding: 0.5rem;
          border-radius: 10px;
          background-color: #303241;
      }

      #entry {
          margin: 0.25rem 0.75rem 0.25rem 0.75rem;
          padding: 0.25rem 0.75rem 0.25rem 0.75rem;
          color: #9699b7;
          border-radius: 8px;
      }

      #entry:selected {
          background-color: #303241;
          color: #d9e0ee;
      }

      ";
  };
  # home.file.".config/wofi/wofi.css" = {
    # source = ./wofi.css;
  # };
}
