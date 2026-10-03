with Ada.Text_IO; use Ada.Text_IO;

package body Hiker is

   function Answer return Integer is
   begin
      Put_Line (Standard_Error, "debug: Answer was called");
      Put_Line (Standard_Error, "debug: Answer is about to return 42");
      return 6 * 7;
   end Answer;

end Hiker;
