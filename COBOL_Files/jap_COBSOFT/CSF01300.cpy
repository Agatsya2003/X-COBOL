       fd   pd01300.
       
       01   f01300-User_Yuuzaa-modulo.
            03 f01300-CompanyCode                   pic 9(03).
            03 f01300-BranchCode                    pic 9(04).
            03 f01300-UserID                   pic 9(11).
            03 f01300-ProgramCode                  pic x(08).
            03 f01300-id-Query_Shokai                  pic x(01).
               88 f01300-AllowQuery               value "S".
            03 f00130-id-inclusao                  pic x(01).
               88 f01300-AllowAdd               value "S".
            03 f01300-id-Maintenance_Hozen                pic x(01).
               88 f01300-AllowMaintenance             value "S".
            03 f00130-id-Delete_Sakujo                  pic x(01).
               88 f01300-permite-Delete_Sakujo               value "S".      


