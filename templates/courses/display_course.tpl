[<*
Copyright 2009-2010 The Schedule Miner Authors
Use of this source code is governed by an MIT-style license that can be
found in the LICENSE file.
*>]

[<*
Display a course.
*>]

[<if isset($error)>]
   <h1>[<$error>]</h1>
[<else>]
   [<* display descriptions column only if one is found *>]
   [<assign var=description value=0>]

   <h3>Course Information:</h3>
   <table>
      <tr>
         <td>Department:</td>
         <td><a href="[<$SM_ROOT>]/courses/display/department/[<$course->department->abbreviation>]">[<$course->department->name>] ([<$course->department->abbreviation>])</a></td>
      </tr>
      <tr>
         <td>Course Number:</td>
         <td>[<$course->course_number>]</td>
      </tr>
   </table>

   [<foreach from=$course->course_sections item=course_section>]
      [<if $course_section->description>]
         [<assign var=description value=1>]
      [</if>]
   [</foreach>]

   <h3>Sections:</h3>
   <table class="data">
      <thead>
         <th>Section</th>
         <th>CRN</th>
         <th>Name</th>
         <th>Instructor</th>
         [<if $description eq 1>]
            <th>Description</th>
         [</if>]
         <th>Add to active schedule</th>
      </thead>

      [<foreach from=$course->course_sections|@sortby:"section" item=course_section>]
         <tr>
            <td class="center bold"><a href="[<$SM_ROOT>]/courses/display/[<$course_section->crn>]">[<$course_section->section>]</a></td>
            <td><a href="[<$SM_ROOT>]/courses/display/[<$course_section->crn>]">[<$course_section->crn>]</a></td>
            <td>[<$course_section->name>]</td>
            <td><a href="[<$SM_ROOT>]/courses/display/instructor/[<$course_section->instructor->id>]">[<$course_section->instructor->name>]</a></td>
            [<if $description eq 1>]
               <td>
                  [<if $course_section->description>]
                     [<$course_section->description>]
                  [<else>]
                     No Description.
                  [</if>]
               </td>
            [</if>]
            <td class="center">[<include file="_add_course_section.tpl">]</td>
         </tr>
      [</foreach>]
   </table>

   [<assign var="users" value=$course->users()>]
   [<if count($users)>]
      <h3>People in This Course:</h3>
      [<foreach from=$course->users() item=user name=user>]
         [<if $user.name>]
            <a href="[<$SM_ROOT>]/schedules/display/[<$user.schedule_id>]">[<$user.name|escape>]</a>[<if !$smarty.foreach.user.last>],[</if>]
         [<else>]
            <a href="[<$SM_ROOT>]/schedules/display/[<$user.schedule_id>]">[<$user.username|escape>]</a>[<if !$smarty.foreach.user.last>],[</if>]
         [</if>]
      [</foreach>]
   [</if>]

   <h3>Course Schedule:</h3>
   [<include file="_schedule_display.tpl" course_sections=$course->course_sections>]
[</if>]
