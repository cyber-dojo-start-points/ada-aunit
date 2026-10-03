with AUnit.Assertions; use AUnit.Assertions;
with Hiker;

package body Answer_Size_Tests is

   procedure Answer_Has_Two_Digits
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer < 100, "Answer has more than two digits");
   end Answer_Has_Two_Digits;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Answer_Has_Two_Digits'Access,
                        "the answer has two digits");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Answer size");
   end Name;

end Answer_Size_Tests;
