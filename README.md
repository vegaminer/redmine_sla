# Redmine SLA plugin

This plugins allows to automatically set a *due date* to an issue according a
defined SLA.

## Installing

Check [Redmine plugin installation procedure](http://www.redmine.org/projects/redmine/wiki/Plugins).

This plugin has been developped tested on Redmine 2.1-stable branch. 
It should work on 2.x

## Configuration

SLA will be defined by project and category.

To configure SLA, go to "Selected Project" -> `Settings` -> `Issue Categories`.
Create or edit a category. You should see two new fields:

* Default SLA
* VIP SLA (see _Other_ section)

## Behaviour

SLA is an offset in days that will be used to calculate the *due date*.

The plugin doesn't change the due date when:

* no category is defined in the issue.
* no SLA is defined (means SLA time == 0).

Pitfall:

* due date is always set when the negated above conditions are met (next version may be smarter)

## Other

This plugin can work with my [Redmine VIP plugin](http://github.com/undx/redmine_vip).
If installed, you set a different SLA for your VIP members.