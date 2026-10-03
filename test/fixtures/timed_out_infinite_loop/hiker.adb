package body Hiker is

   function Answer return Integer is
      Result : Integer := 0;
   begin
      while Result /= 999 loop
         Result := 6 * 7;
      end loop;
      return Result;
   end Answer;

end Hiker;
