with AUnit.Assertions; use AUnit.Assertions;
with Hiker;

package body Hiker_Tests is

   procedure Life_The_Universe_And_Everything
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Anser = 42, "Answer is not 42");
   end Life_The_Universe_And_Everything;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Life_The_Universe_And_Everything'Access,
                        "life, the universe, and everything");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Hiker");
   end Name;

end Hiker_Tests;
