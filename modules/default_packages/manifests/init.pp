class default_packages {

   package {
      "sudo":
         ensure   => installed,
   }
   package {
      "screen":
         ensure   => installed,
   }
   package {
      "yum-utils":
         ensure   => installed,
   }

   package {
      "rsyslog":
         ensure   => installed,
   }

   package {
      "bc":
         ensure   => installed,
   }

   package {
      "postfix":
         ensure   => installed,
   }

   package {
      "ruby-shadow":
         ensure   => installed,
   }

   package {
      "tcpdump":
         ensure   => installed,
   }

   package {
      "sysstat":
         ensure   => installed,
   }

   package {
      "lsof":
         ensure   => installed,
   }

   package {
      "vim-enhanced":
         ensure   => installed,
   }

   package {
      "bind-utils":
         ensure   => installed,
   }

   package {
      "telnet":
         ensure   => installed,
   }

   package {
      "ftp":
         ensure   => installed,
   }

   package {
      "man":
         ensure   => installed,
   }

}

