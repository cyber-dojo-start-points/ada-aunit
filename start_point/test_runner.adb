with Ada.Command_Line;
with AUnit;
with AUnit.Reporter.Text;
with AUnit.Run;
with AUnit.Test_Suites; use AUnit.Test_Suites;

with AUnit_Assertions_Tests;
with Hiker_Tests;

procedure Test_Runner is

   function Suite return Access_Test_Suite is
      Result : constant Access_Test_Suite := new Test_Suite;
   begin
      Result.Add_Test (new AUnit_Assertions_Tests.Test);
      Result.Add_Test (new Hiker_Tests.Test);
      return Result;
   end Suite;

   function Run is new AUnit.Run.Test_Runner_With_Status (Suite);

   Reporter : AUnit.Reporter.Text.Text_Reporter;

   use type AUnit.Status;

begin
   if Run (Reporter) /= AUnit.Success then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
end Test_Runner;
