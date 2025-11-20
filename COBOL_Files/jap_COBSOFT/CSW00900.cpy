       78   c-carregar-linkage                     value "CS00002S".
       78   c-Message_Messeji                             value "CS00003S".
       78   c-sleep                                value "CS00006S".
       78   c-StandardFrame                         value "CS00000F".
       78   c-pesquisar-ZipCode_Yubin                        value "CS10001P".
       78   c-proximo-documento                    value "CS00105S".

       78   c-caracteres-invalidos                 value "".
       78   c-caracteres-invalidos-conv            value "CAAAAOOOOEEUUUIIIcaaaaooooeeuuuiii".

       01   ws-campos-work.
            03 ws-Parameters-Message_Messeji.
               05 ws-Message_Messeji                      pic x(560).
               05 ws-Message_Messeji-Option_Opushon                pic x(02).
                  88 ws-MessageOptionYes              value "S".
                  88 ws-Message_Messeji-Option_Opushon-nao              value "N".
            03 ws-AccessResult                 pic x(02).
               88 ws-acesso-Invalid_Mukou                   value "47", "48", "49".
               88 ws-OperationOK                       value "00", "02".
               88 ws-eof-File_Fairu                       value "10".
               88 ws-RecordNotFound              value "23".
               88 ws-Record_Kiroku-existente                value "22".
               88 ws-File_Fairu-inexistente               value "35".
               88 ws-File_Fairu-locado                    value "9A".
               88 ws-Record_Kiroku-locado                   value "9D".
            03 ws-AccessResult-xml             pic s9(09)  value zeros.
               88 ws-OperationOK-xml                   value 0 thru 999999999.
            03 ws-Parameters-cbl-run.
               05 ws-command-exec                  pic x(500)  value spaces.
               05 ws-run-unit-id                   pic x(08)   comp-5.
               05 ws-stack-size                    pic x(04)   comp-5.
               05 ws-flags                         pic x(04)   comp-5 value zeros.
            03 ws-cbl-status-code                  pic x(02)   comp-5.
            03 ws-cbl-status-code-x                pic x(05).
            03 ws-data                             pic 9(08).
            03 filler redefines ws-data.
               05 ws-dia                           pic 9(02).
               05 ws-mes                           pic 9(02).
               05 ws-ano                           pic 9(04).
            03 ws-data-inv                         pic 9(08).
            03 filler redefines ws-data-inv.
               05 ws-ano-inv                       pic 9(04).
               05 ws-mes-inv                       pic 9(02).
               05 ws-dia-inv                       pic 9(02).
            03 ws-Hours                            pic 9(08).
            03 ws-hh-mm-ss redefines ws-Hours.
               05 ws-Hours-hh                      pic 9(02).
               05 ws-Hours-mm                      pic 9(02).
               05 ws-Hours-ss                      pic 9(02).
               05 filler                           pic 9(02).
            03 ws-mascara-cnpj                     pic x(18)    value "  .   .   /    -   ".
            03 ws-mascara-cpf                      pic x(14)    value "   .   .   -  ".
            03 ws-mascara-ZipCode_Yubin                      pic x(09)    value "     -   ".
            03 ws-mascara-Phone_Denwa                 pic x(20)    value "+   (   )      -    ".
            03 ws-mascara-data                     pic x(10)    value "  /  /    ".
            03 ws-nr-segundos                      pic 9(06).   
