# -*- coding: utf-8 -*-
<hr />
<h4>${_('History')}</h4>
% for index, step in enumerate(history):
    <%
    first = "first" if index == 0 else ""
    last = "last" if index == len(history) - 1 else ""
    %>

    <div class="history ${first} ${last}">
    % if  step.state == 1:
    <span><i class="icon-lock"></i> <b>${_('Locked')}</b> ${_('by')} ${step.user.username}</span>
    % elif  step.state == 2:
    <span><i class="icon-ok"></i> <b>${_('Marked as done')}</b> ${_('by')} ${step.prev_user.username}</span>
    % elif  step.state == 0 and step.old_state == 2:
    <span><i class="icon-thumbs-down"></i> <b>${_('Invalidated')}</b> ${_('by')} ${step.user.username}</span>
    % else:
    <span>${_('Unlocked')}</span>
    % endif

      <p class="muted"><em title="${step.update}" class="timeago"></em>
      </p>
    </div>
% endfor

% if len(history) == 0:
<div>${_('Nothing has happen yet.')}</div>
% endif

<script>$('.timeago').timeago()

</script>
