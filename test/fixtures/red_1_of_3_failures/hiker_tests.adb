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

   procedure Answer_Is_More_Than_41
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer > 41, "Answer is not more than 41");
   end Answer_Is_More_Than_41;

   procedure Answer_Is_Less_Than_100
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Hiker.Answer < 100, "Answer is not less than 100");
   end Answer_Is_Less_Than_100;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Life_The_Universe_And_Everything'Access,
                        "life, the universe, and everything");
      Register_Routine (T, Answer_Is_More_Than_41'Access,
                        "the answer is more than 41");
      Register_Routine (T, Answer_Is_Less_Than_100'Access,
                        "the answer is less than 100");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Hiker");
   end Name;

end Hiker_Tests;
