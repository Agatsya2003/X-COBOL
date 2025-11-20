       fd   pd01100.
       
       01   f01100-Profile_Purofiru-modulo.
            03 f01100-CompanyCode                   pic 9(03).
            03 f01100-BranchCode                    pic 9(04).
            03 f01100-ProfileCode                    pic 9(03).
            03 f01100-ProgramCode                  pic x(08).
            03 f01100-id-Query_Shokai                  pic x(01).
               88 f01100-AllowQuery               value "S".
            03 f01100-id-inclusao                  pic x(01).
               88 f01100-AllowAdd               value "S".
            03 f01100-id-Maintenance_Hozen                pic x(01).
               88 f01100-AllowMaintenance             value "S".
            03 f01100-id-Delete_Sakujo                  pic x(01).
               88 f01100-permite-Delete_Sakujo               value "S".    

