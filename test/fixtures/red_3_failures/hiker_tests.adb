with AUnit.Assertions; use AUnit.Assertions;
with Hiker;

package body Hiker_Tests is

   procedure Life_The_Universe_And_Everything
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer = 42,
              "Answer was" & Integer'Image (Hiker.Answer));
   end Life_The_Universe_And_Everything;

   procedure Answer_Is_Less_Than_50
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer < 50, "Answer is not less than 50");
   end Answer_Is_Less_Than_50;

   procedure Answer_Is_Not_54
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer /= 54, "Answer is 54");
   end Answer_Is_Not_54;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Life_The_Universe_And_Everything'Access,
                        "life, the universe, and everything");
      Register_Routine (T, Answer_Is_Less_Than_50'Access,
                        "the answer is less than 50");
      Register_Routine (T, Answer_Is_Not_54'Access,
                        "the answer is not 54");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Hiker");
   end Name;

end Hiker_Tests;
