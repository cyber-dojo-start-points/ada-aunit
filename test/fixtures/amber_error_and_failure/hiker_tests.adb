with AUnit.Assertions; use AUnit.Assertions;
with Hiker;

package body Hiker_Tests is

   procedure Six_Times_Nine
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (6 * 9 = 42, "6 * 9 is not 42");
   end Six_Times_Nine;

   procedure Life_The_Universe_And_Everything
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer = 42,
              "Answer was" & Integer'Image (Hiker.Answer));
   end Life_The_Universe_And_Everything;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Six_Times_Nine'Access,
                        "six times nine");
      Register_Routine (T, Life_The_Universe_And_Everything'Access,
                        "life, the universe, and everything");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Hiker");
   end Name;

end Hiker_Tests;
