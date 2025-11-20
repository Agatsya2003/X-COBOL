      *>=================================================================================
      *>    
      *>                          Linkage Padro - Sistema
      *>
      *>=================================================================================
      
       01   lnk-par.
            03 lnk-Option_Opushon                           pic 9(002).
               88 lnk-carregar-diretorios              value 01.
               88 lnk-carregar-prametros               value 02.
               88 lnk-carregar-completa                value 03.
            03 lnk-status                          pic 9(002).
               88 lnk-sem-erros                        value 00.
               88 lnk-com-warning                      value 01.
               88 lnk-WithErrors                        value 02.
            03 lnk-path.
               05 lnk-cgi-path                     pic x(200).
               05 lnk-DataPath                     pic x(200).
               05 lnk-tmp-path                     pic x(200).
               05 lnk-int-path                     pic x(200).
               05 lnk-dvs-path                     pic x(200).
               05 lnk-log-path                     pic x(200).
               05 lnk-nfe-path                     pic x(200).
            03 lnk-Company_Kaisha.
               05 lnk-CompanyCode                   pic 9(003).
               05 lnk-BranchCode                    pic 9(004).
               05 lnk-cnpj                         pic 9(014).
               05 lnk-razao-social                 pic x(060).
               05 lnk-Name_Namae-fantasia                pic x(060).
            03 lnk-User_Yuuzaa.
               05 lnk-UserID                   pic x(011).
               05 lnk-UserPassword                   pic x(015).
               05 lnk-UserName                 pic x(060).
               05 lnk-status-User_Yuuzaa               pic x(001).
                  88 lnk-User_Yuuzaa-Active_Akutibu                  value "A".
                  88 lnk-User_Yuuzaa-bloqueado              value "B".
                  88 lnk-User_Yuuzaa-inativo                value "I".
               05 lnk-id-MasterLogin              pic x(001).
                  88 lnk-MasterLogin                   value "M".    
            03 lnk-informacoes-programa.
               05 lnk-ProgramCode                  pic x(008).
               05 lnk-vs-programa                  pic x(001).
               05 lnk-ds-programa                  pic x(116).
               05 lnk-ds-Function_Kinou                    pic x(116). 
               05 lnk-id-Query_Shokai                  pic x(01).
                  88 lnk-AllowQuery               value "S".
                  88 lnk-nao-AllowQuery           value "N".
               05 lnk-id-inclusao                  pic x(01).
                  88 lnk-AllowAdd               value "S".
                  88 lnk-nao-AllowAdd           value "N".
               05 lnk-id-Maintenance_Hozen                pic x(01).
                  88 lnk-AllowMaintenance             value "S".
                  88 lnk-nao-AllowMaintenance         value "N".
               05 lnk-id-Delete_Sakujo                  pic x(01).
                  88 lnk-permite-Delete_Sakujo               value "S".
                  88 lnk-nao-permite-Delete_Sakujo           value "N".                
            03 lnk-sistema-operacional.
               05 lnk-data-so                      pic 9(008).
               05 filler redefines lnk-data-so.
                  07 lnk-dia-os                    pic 9(002).
                  07 lnk-mes-os                    pic 9(002).
                  07 lnk-ano-os                    pic 9(004).
               05 lnk-Name_Namae-computador              pic x(060).
               05 lnk-ambiente                     pic x(003).
                  88 lnk-Development_Kaihatsu               value "DSV".
                  88 lnk-homologacao                   value "HML".
                  88 lnk-producao                      value "PRD".
            03 lnk-ctrl-execucao                   pic x(001).
               88 lnk-execucao-foreground              value " ".
               88 lnk-execucao-background              value "B".
            03 lnk-Line_Gyou-comando                   pic x(500).
            03 lnk-Parameters-emissao.
               05 lnk-Number-documento             pic 9(09).
               05 lnk-Series-documento              pic 9(03).

