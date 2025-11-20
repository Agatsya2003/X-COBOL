       fd   pd00100.
       
       01   f00100-Modules_Mojuru.
            03 f00100-CompanyCode                   pic 9(03).
            03 f00100-BranchCode                    pic 9(04).
            03 f00100-MainProgram           pic x(08).
            03 f00100-ProgramCode                  pic x(08).
            03 f00100-ProgramType                pic x(01).
               88 f00100-LogicalProgram                value "L".
               88 f00100-PhysicalProgram                value "F".
            03 f00100-ProgramOperation            pic 9(02).
            03 f00100-ProgramDesc           pic x(55). 
      


