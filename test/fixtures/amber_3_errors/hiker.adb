package body Hiker is

   function Answer return Integer is
   begin
      raise Constraint_Error with "the answer is not ready yet";
      return 6 * 7;
   end Answer;

end Hiker;
