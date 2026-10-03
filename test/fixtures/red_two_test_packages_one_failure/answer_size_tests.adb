with AUnit.Assertions; use AUnit.Assertions;
with Hiker;

package body Answer_Size_Tests is

   procedure Answer_Has_One_Digit
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer < 10, "Answer has more than one digit");
   end Answer_Has_One_Digit;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Answer_Has_One_Digit'Access,
                        "the answer has one digit");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Answer size");
   end Name;

end Answer_Size_Tests;
