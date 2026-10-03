with AUnit.Assertions; use AUnit.Assertions;

-- These show the assertions AUnit gives you. They test literals rather
-- than anything in Hiker, so they keep passing while you rewrite Hiker
-- around them.

package body AUnit_Assertions_Tests is

   procedure Assert_A_Condition
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (6 * 7 = 42, "6 * 7 should be 42");
   end Assert_A_Condition;

   procedure Assert_Two_Strings_Are_Equal
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert ("Hello, " & "World!", "Hello, World!", "strings differ");
   end Assert_Two_Strings_Are_Equal;

   procedure Raise_Constraint_Error is
   begin
      raise Constraint_Error;
   end Raise_Constraint_Error;

   procedure Assert_An_Exception_Is_Raised
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert_Exception (Raise_Constraint_Error'Access, "nothing was raised");
   end Assert_An_Exception_Is_Raised;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Assert_A_Condition'Access,
                        "assert a condition");
      Register_Routine (T, Assert_Two_Strings_Are_Equal'Access,
                        "assert two strings are equal");
      Register_Routine (T, Assert_An_Exception_Is_Raised'Access,
                        "assert an exception is raised");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("AUnit assertions");
   end Name;

end AUnit_Assertions_Tests;
