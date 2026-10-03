with Ada.Text_IO; use Ada.Text_IO;

package body Hiker is

   function Answer return Integer is
   begin
      for I in 0 .. 4000 loop
         Put_Line ("debug: i is" & Integer'Image (I)
                   & ", and the answer is still on its way");
      end loop;
      return 6 * 7;
   end Answer;

end Hiker;
