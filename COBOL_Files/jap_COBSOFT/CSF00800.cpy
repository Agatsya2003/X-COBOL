       fd   pd00800.
       
       01   f00800-User_Yuuzaa.
            03 f00800-UserID                   pic 9(11).
            03 f00800-UserPassword                   pic x(15).
            03 f00800-UserName                 pic x(55).
            03 f00800-data-nascimento              pic 9(08).
            03 f00800-sexo                         pic x(01).
               88 f00800-masculino                     value "M".
               88 f00800-feminino                      value "F".
            03 f00800-Email                        pic x(55).
            03 f00800-id-atribuir-acesso           pic x(01).
               88 f00800-permite-atribuir-acesso       value "S".
            03 f00800-StatusID-User_Yuuzaa            pic x(01).
               88 f00800-inativo                       value "I".
               88 f00800-bloqueado                     value "B".
               88 f00800-em-aprovacao                  value "E".
               88 f00800-Active_Akutibu                         value "A".
            03 f00800-id-trocar-senha              pic x(01).
               88 f00800-trocar-senha                  value "S".
            03 f00800-id-Profile_Purofiru-especial           pic x(01).
               88 f00800-Development_Kaihatsu               value "D".
            03 f00800-data-criacao                 pic 9(08).
            03 f00800-Time-criacao                 pic 9(08).
            03 f00800-data-ultimo-Login            pic 9(08).
            03 f00800-Time-ultimo-Login            pic 9(08).
            03 f00800-maquina-Login                pic x(55).   
            
            
            
      


