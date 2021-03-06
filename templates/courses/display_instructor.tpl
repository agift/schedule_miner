[<*
Copyright 2009-2010 The Schedule Miner Authors
Use of this source code is governed by an MIT-style license that can be
found in the LICENSE file.
*>]

[<*
Display an instructor.
*>]

[<if isset($error)>]
   <h1>[<$error>]</h1>
[<else>]
   <h3>Instructor Information:</h3>
   <table>
      <tr>
         <td>Name:</td>
         <td>[<$instructor->name>]</td>
      </tr>
   </table>

   <h3>Course Sections:</h3>
   [<if isset($empty)>]
      This instructor does not have any course sections.
   [<else>]
      <table class="data">
         <thead>
            <th>Course</th>
            <th>Section</th>
            <th>CRN</th>
            <th>Name</th>
            <th>Add to active schedule</th>
         </thead>

         [<foreach from=$instructor->course_sections item=course_section>]
            <tr>
               <td><a href="[<$SM_ROOT>]/courses/display/[<$course_section->course->department->abbreviation>]/[<$course_section->course->course_number>]">[<$course_section->course->department->abbreviation>] [<$course_section->course->course_number>]</a></td>
               <td class="center"><a href="[<$SM_ROOT>]/courses/display/[<$course_section->crn>]">[<$course_section->section>]</a></td>
               <td><a href="[<$SM_ROOT>]/courses/display/[<$course_section->crn>]">[<$course_section->crn>]</a></td>
               <td>[<$course_section->name>]</td>
               <td class="center">[<include file="_add_course_section.tpl">]</td>
            </tr>
         [</foreach>]
      </table>

      <h3>Course Schedule:</h3>
      [<include file="_schedule_display.tpl" course_sections=$instructor->course_sections>]
   [</if>]
[</if>]
